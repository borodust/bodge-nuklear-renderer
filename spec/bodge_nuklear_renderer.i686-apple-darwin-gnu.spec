[{"tag":"struct","ns":0,"name":"nk_context","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:440:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"enum","ns":0,"name":"","id":12,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:456:1","fields":[{"tag":"field","name":"nk_false","value":0},{"tag":"field","name":"nk_true","value":1}]},{"tag":"struct","ns":0,"name":"nk_font","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:3935:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"struct","ns":0,"name":"nk_font","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:3992:8","bitSize":576,"bitAlignment":32,"fields":[{"tag":"field","name":"next","bitOffset":0,"bitSize":32,"bitAlignment":32,"type":{"tag":":pointer","type":{"tag":":struct","name":"nk_font","id":39}}},{"tag":"field","name":"scale","bitOffset":384,"bitSize":32,"bitAlignment":32,"type":{"tag":":float","bitSize":32,"bitAlignment":32}}]},{"tag":"struct","ns":0,"name":"nk_context","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/lib\/nuklear\/nuklear.h:5569:8","bitSize":103648,"bitAlignment":32,"fields":[{"tag":"field","name":"delta_time_seconds","bitOffset":58624,"bitSize":32,"bitAlignment":32,"type":{"tag":":float","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"build","bitOffset":103040,"bitSize":32,"bitAlignment":32,"type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"use_pool","bitOffset":103072,"bitSize":32,"bitAlignment":32,"type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"count","bitOffset":103584,"bitSize":32,"bitAlignment":32,"type":{"tag":":unsigned-int","bitSize":32,"bitAlignment":32}},{"tag":"field","name":"seq","bitOffset":103616,"bitSize":32,"bitAlignment":32,"type":{"tag":":unsigned-int","bitSize":32,"bitAlignment":32}}]},{"tag":"struct","ns":0,"name":"nk_bodge_renderer","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null},{"tag":"function","name":"nk_bodge_renderer_create","ns":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:25:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"max_vertex_buffer","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"max_element_buffer","type":{"tag":":int","bitSize":32,"bitAlignment":32}}],"returnType":{"tag":":pointer","type":{"tag":"struct","ns":0,"name":"nk_bodge_renderer","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}},{"tag":"function","name":"nk_bodge_render","ns":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:28:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"ctx","type":{"tag":":pointer","type":{"tag":":struct","name":"nk_context","id":112}}},{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":1684956530,"name":"nk_bodge_renderer","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}},{"tag":"parameter","name":"width","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"height","type":{"tag":":int","bitSize":32,"bitAlignment":32}},{"tag":"parameter","name":"pixel_ratio","type":{"tag":":float","bitSize":32,"bitAlignment":32}}],"returnType":{"tag":":void"}},{"tag":"function","name":"nk_bodge_renderer_font","ns":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:31:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":116,"name":"nk_bodge_renderer","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}}],"returnType":{"tag":":pointer","type":{"tag":":struct","name":"nk_font","id":39}}},{"tag":"function","name":"nk_bodge_renderer_destroy","ns":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:34:1","variadic":null,"inline":null,"storageClass":"none","parameters":[{"tag":"parameter","name":"renderer","type":{"tag":":pointer","type":{"tag":"struct","ns":364649273,"name":"nk_bodge_renderer","id":0,"location":"\/Users\/travis\/build\/borodust\/bodge-nuklear-renderer\/bodge_nuklear_renderer.h:22:8","bitSize":0,"bitAlignment":0,"fields":null}}}],"returnType":{"tag":":void"}}]