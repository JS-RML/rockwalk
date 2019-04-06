file(REMOVE_RECURSE
  "moveit_setup_assistant_updater_automoc.cpp"
  "moveit_setup_assistant_automoc.cpp"
  "moveit_setup_assistant_widgets_automoc.cpp"
  "moveit_setup_assistant_tools_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/actionlib_generate_messages_eus.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
