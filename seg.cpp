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
typedef CGAL::Exact_predicates_inexact_constructions_kernel Kernel;
typedef CGAL::Surface_mesh<Kernel::Point_3> SM;
typedef boost::graph_traits<SM>::face_descriptor face_descriptor;

using Path = std::filesystem::path;

int main(int argc, char** argv)
{
    if (argc < 4 )
    {
        std::cout << "Usage\n";
        std::cout << "./seg.exe filename starting_clusters smoothning_lambda out_dir_name\n";
        return EXIT_FAILURE;
    }
    
    Path dir_path;
    bool dir;
    if (argc == 4)
    {
        dir_path = std::filesystem::path("debug_segments");
    }
    else {
        dir_path = std::filesystem::path(argv[4]);
    }

    if (std::filesystem::exists(dir_path)) {
        std::filesystem::current_path(dir_path);
        dir = true;
    }
    else
    {
        dir = std::filesystem::create_directory(dir_path);
        std::filesystem::current_path(dir_path);
    }

    const std::string filename =  argv[1] ;
    const std::size_t number_of_clusters = std::stoi(argv[2]);
    const double smoothning = std::stoi(argv[3]);

    if (!dir)
    {
        std::cout << "Could not create directory\n";
    }

    SM mesh;
    if (!CGAL::Polygon_mesh_processing::IO::read_polygon_mesh(filename, mesh) ||
        !CGAL::is_triangle_mesh(mesh))
    {
        std::cerr << "Invalid input file." << std::endl;
        return EXIT_FAILURE;
    }
    typedef SM::Property_map<face_descriptor, double> Facet_double_map;
    Facet_double_map sdf_property_map;
    sdf_property_map = mesh.add_property_map<face_descriptor, double>("f:sdf").first;
    CGAL::sdf_values(mesh, sdf_property_map);
    // create a property-map for segment-ids
    typedef SM::Property_map<face_descriptor, std::size_t> Facet_int_map;
    Facet_int_map segment_property_map = mesh.add_property_map<face_descriptor, std::size_t>("f:sid").first;;
    // segment the mesh using default parameters for number of levels, and smoothing lambda
    // Any other scalar values can be used instead of using SDF values computed using the CGAL function
   
    std::size_t number_of_segments = CGAL::segmentation_from_sdf_values(mesh, sdf_property_map, segment_property_map, number_of_clusters, smoothning);
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
        oss << "Segment_" << id << ".off";
        std::ofstream os(oss.str().data());
        os << out;
    }
}