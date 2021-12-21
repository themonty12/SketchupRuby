def selection_gp
  mod = Sketchup.active_model
  sel = mod.selection
  if sel.count > 0
    gps = sel.grep(Sketchup::Group)
    sel.clear
    sel.add(gps)
  end
end

def selection_edge
  mod = Sketchup.active_model
  sel = mod.selection
  if sel.count > 0
    edges = sel.grep(Sketchup::Edge)
    sel.clear
    sel.add(edges)
  end
end

def selection_face
  mod = Sketchup.active_model
  sel = mod.selection
  if sel.count > 0
    faces = sel.grep(Sketchup::Face)
    sel.clear
    sel.add(faces)
  end
end

def selection_component
  mod = Sketchup.active_model
  sel = mod.selection
  if sel.count > 0
    compos = sel.grep(Sketchup::ComponentInstance)
    sel.clear
    sel.add(compos)
  end
end

unless file_loaded?(__FILE__)
  UI.add_context_menu_handler do |menu|
    menu.add_separator
    menu = menu.add_submenu('선택')
    menu.add_item('그룹') {selection_gp}
    menu.add_item('선') {selection_edge}
    menu.add_item('면') {selection_face}
    menu.add_item('컴포넌트') {selection_component}
  end
end
file_loaded(__FILE__)
