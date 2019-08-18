[{"tag":"struct","ns":0,"name":"nk_context","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:440:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"enum","ns":0,"name":"","id":2,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:456:1","fields":[{"tag":"field","name":"nk_false","value":0},{"tag":"field","name":"nk_true","value":1}]},{"tag":"struct","ns":0,"name":"nk_font","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:3935:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"struct","ns":0,"name":"nk_font","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:3992:8","bitSize":1024,"bitAlignment":64,"fields":[{"tag":"field","name":"next","bitOffset":0,"bitSize":64,"bitAlignment":64,"type":{"tag":":pointer","type":{"tag":":struct","name":"nk_font","id":29}}},{"tag":"field","name":"scale","bitOffset":640,"bitSize":32,"bitAlignment":32,"type":{"tag":":float","bitSize":32,"bitAlignment":32}}]},{"tag":"struct","ns":0,"name":"nk_context","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:5569:8","bitSize":132992,"bitAlignment":64,"fields":[{"tag":"field","name":"delta_time_seconds","bitOffset":86400,"bitSize":32,"bitAlignment":32,"type":{"tag":":float","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"build","bitOffset":131968,"bitSize":32,"bitAlignment":32,"type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"use_pool","bitOffset":132000,"bitSize":32,"bitAlignment":32,"type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"count","bitOffset":132928,"bitSize":32,"bitAlignment":32,"type":{"tag":":unsigned-int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"seq","bitOffset":132960,"bitSize":32,"bitAlignment":32,"type":{"tag":":unsigned-int","bitSize":32,"bitAlignment":32}}]},{"tag":"struct","ns":0,"name":"nk_bodge_renderer","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"function","name":"nk_bodge_renderer_create","ns":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:25:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"max_vertex_buffer","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"max_element_buffer","type":{"tag":":int","bitSize":32,"bitAlignment":32}}],"returnType":{"tag":":pointer","type":{"tag":"struct","ns":1868705637,"name":"nk_bodge_renderer","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}},{"tag":"function","name":"nk_bodge_render","ns":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:28:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"ctx","type":{"tag":":pointer","type":{"tag":":struct","name":"nk_context","id":102}}},{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":1647273325,"name":"nk_bodge_renderer","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}},{"tag":"parameter","name":"width","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"height","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"pixel_ratio","type":{"tag":":float","bitSize":32,"bitAlignment":32}}],"returnType":{"tag":":void"}},{"tag":"function","name":"nk_bodge_renderer_font","ns":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:31:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":1868705637,"name":"nk_bodge_renderer","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}}],"returnType":{"tag":":pointer","type":{"tag":":struct","name":"nk_font","id":29}}},{"tag":"function","name":"nk_bodge_renderer_destroy","ns":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:34:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":1868705637,"name":"nk_bodge_renderer","id":0,"location":"\/home\/borodust\/devel\/repo\/bodge-projects\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}}],"returnType":{"tag":":void"}}]