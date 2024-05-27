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

void thread_segment(SM& mesh, std::size_t num_clusters, double smooth) noexcept {
    typedef SM::Property_map<face_descriptor, double> Facet_double_map;
    Facet_double_map sdf_property_map;
    sdf_property_map = mesh.add_property_map<face_descriptor, double>("f:sdf").first;
    CGAL::sdf_values(mesh, sdf_property_map);
    // create a property-map for segment-ids
    typedef SM::Property_map<face_descriptor, std::size_t> Facet_int_map;
    Facet_int_map segment_property_map = mesh.add_property_map<face_descriptor, std::size_t>("f:sid").first;;
    // segment the mesh using default parameters for number of levels, and smoothing lambda
    // Any other scalar values can be used instead of using SDF values computed using the CGAL function

    std::size_t number_of_segments = CGAL::segmentation_from_sdf_values(mesh, sdf_property_map, segment_property_map, num_clusters, smooth);
    typedef CGAL::Face_filtered_graph<SM> Filtered_graph;
    //print area of each segment and then put it in a Mesh and print it in an OFF file
    Filtered_graph segment_mesh(mesh);
    for (std::size_t id = 0; id < number_of_segments; ++id)
    {
        segment_mesh.set_selected_faces(id, segment_property_map);
        std::cout << "Segment " << id << "'s area is : " << CGAL::Polygon_mesh_processing::area(segment_mesh) << std::endl;
        SM out;
        CGAL::copy_face_graph(segment_mesh, out);
        std::ostringstream oss;
        CGAL::IO::write_STL("Segment_" + std::to_string(id) + ".stl", out);
    }
}


int main(int argc, char** argv)
{
    Path dir_path = Path("debug_segments");
    Path parent_dir = Path("../");
    bool dir;

    std::string filename ;

    std::size_t number_of_clusters;
    double starting_smoothning;
    
    if (argc < 4)
    {
        filename = "./dummy.off";
        number_of_clusters = 3;
        starting_smoothning = 0.8;
    }
    else
    {
        filename = argv[1];
        number_of_clusters = atoi(argv[2]);
        starting_smoothning = atoi(argv[3]);
    }

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

    SM mesh;
    if (!CGAL::Polygon_mesh_processing::IO::read_polygon_mesh(filename, mesh) ||
        !CGAL::is_triangle_mesh(mesh))
    {
        std::cerr << "Invalid input file." << std::endl;
        return EXIT_FAILURE;
    }

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
            thread_segment(mesh, i, j);

            //Change to parent directory
            fs::current_path(parent_dir);
        }
    }
}