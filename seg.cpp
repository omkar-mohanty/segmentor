#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Surface_mesh.h>
#include <CGAL/boost/graph/copy_face_graph.h>
#include <CGAL/boost/graph/Face_filtered_graph.h>
#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/Polygon_mesh_processing/IO/polygon_mesh_io.h>
#include <CGAL/mesh_segmentation.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include<filesystem>
#include<string>

namespace fs = std::filesystem;

typedef CGAL::Exact_predicates_inexact_constructions_kernel Kernel;
typedef CGAL::Surface_mesh<Kernel::Point_3> SM;
typedef boost::graph_traits<SM>::face_descriptor face_descriptor;
typedef std::shared_ptr<SM> SmPtr;

using Path = fs::path;

const double MAX_SMOOTHNING = 1.0;

class Mesh
{
public:
    Mesh(std::string);
    Mesh(SM&&, std::string);
    auto segment(std::size_t, double) -> std::vector<Mesh>;
    auto write_to_file() -> void;
    ~Mesh();

private:
    std::string name_;
    SM mesh_;
};

Mesh::Mesh(SM&& mesh, std::string name):mesh_(mesh),name_(name) {

}

Mesh::Mesh(std::string filename) 
{
    Path mesh_path = filename;
    auto name = mesh_path.filename();
    SM mesh;
    if (!CGAL::Polygon_mesh_processing::IO::read_polygon_mesh(filename, mesh) ||
        !CGAL::is_triangle_mesh(mesh))
    {
        std::cerr << "Invalid input file." << std::endl;
    }
    mesh_ = mesh;
    name_ = name.generic_string();
}

auto Mesh::segment(std::size_t num_clusters, double smooth) -> std::vector<Mesh>
{
    typedef SM::Property_map<face_descriptor, double> Facet_double_map;
    Facet_double_map sdf_property_map;
    sdf_property_map = mesh_.add_property_map<face_descriptor, double>("f:sdf").first;
    CGAL::sdf_values(mesh_, sdf_property_map);
    // create a property-map for segment-ids
    typedef SM::Property_map<face_descriptor, std::size_t> Facet_int_map;
    Facet_int_map segment_property_map = mesh_.add_property_map<face_descriptor, std::size_t>("f:sid").first;;
    // segment the mesh using default parameters for number of levels, and smoothing lambda
    // Any other scalar values can be used instead of using SDF values computed using the CGAL function

    std::size_t number_of_segments = CGAL::segmentation_from_sdf_values(mesh_, sdf_property_map, segment_property_map, num_clusters, smooth);
    typedef CGAL::Face_filtered_graph<SM> Filtered_graph;
    //print area of each segment and then put it in a Mesh and print it in an OFF file
    Filtered_graph segment_mesh(mesh_);
    auto segments = std::vector<Mesh>();
    for (std::size_t id = 0; id < number_of_segments; ++id)
    {
        segment_mesh.set_selected_faces(id, segment_property_map);
        std::cout << "Segment " << id << "'s area is : " << CGAL::Polygon_mesh_processing::area(segment_mesh) << std::endl;
        SM out;
        CGAL::copy_face_graph(segment_mesh, out);
        segments.push_back(Mesh(std::move(out), name_ + std::to_string(id)));
    }
    return segments;
}

auto Mesh::write_to_file() -> void
{
    CGAL::IO::write_STL(name_ + ".stl", mesh_);
}

Mesh::~Mesh()
{
}

std::mutex mesh_mutex;

auto thread_segmentation(Mesh &mesh, std::size_t num_clusters, double smooth) -> std::vector < Mesh > {
    std::lock_guard<std::mutex> guard(mesh_mutex);
    return mesh.segment(num_clusters, smooth);
}

int main(int argc, char** argv)
{
    
    if (argc < 4)
    {
        std::cout << "Usage \n";
        std::cout << "./seg.exe filename max_clusters initial_smoothning\n";
        return EXIT_FAILURE;
    }

    std::string filename = argv[1];
    std::size_t number_of_clusters = atoi(argv[2]);
    double starting_smoothning = atoi(argv[3]);


    Path dir_path = Path("debug_segments");
    Path parent_dir = Path("../");
    bool dir;

    if (fs::exists(dir_path)) {
        fs::current_path(dir_path);
        dir = true;
    }
    else
    {
        dir = fs::create_directory(dir_path);
        fs::current_path(dir_path);
    }

    if (!dir)
    {
        std::cout << "Could not create directory\n";
    }

    std::size_t starting_clusters = 2;
    double initial_smoothning = 0.1;

    Mesh mesh(filename);
   

    auto segmentor_threads = std::vector<std::thread>();

    std::cout <<"In Folder : "<< fs::current_path()<<" Starting segmentation" << "\n";
    for (size_t i = starting_clusters; i <= number_of_clusters; i++)
    {

        for (double j = starting_smoothning; j <= MAX_SMOOTHNING; j += 0.1)
        {
            // Create folder
            auto segment_dir_name = "Clusters" + std::to_string(i) + " Smootning" + std::to_string(j);
            auto current_path = fs::current_path();

            try
            {
                auto segment_dir = fs::create_directory(segment_dir_name);
            }
            catch (const std::exception& e)
            {
                std::cout << "Exception : " << e.what() << "\n";
            }
           
            // Change directorys
            std::cout << "In Folder : " << fs::current_path() << "\n";

            fs::current_path(segment_dir_name);
            std::cout << "In Folder : " << fs::current_path() << "\n";

            // Do segmentation

            auto segments = mesh.segment(i, j);

            for (auto segment : segments) {
                segment.write_to_file();
            }

            //Change to parent directory
            fs::current_path(parent_dir);
        }
    }
}