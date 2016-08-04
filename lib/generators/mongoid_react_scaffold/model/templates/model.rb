<% module_namespacing do -%>
class <%= class_name %><%= " < #{options[:parent].classify}" if options[:parent] %>
<% unless options[:parent] -%>
  include Mongoid::Document
<% end -%>
  include Mongoid::Timestamps
<% if options[:collection] -%>
  store_in collection: "<%= options[:collection] %>"
<% end -%>
<% attributes.reject{|attr| attr.reference?}.each do |attribute| -%>
  field :<%= attribute.name %>, type: <%= attribute.type_class %>
<% end -%>
<% attributes.select{|attr| attr.reference? }.each do |attribute| -%>
  embedded_in :<%= attribute.name%>
<% end -%>
end
<% end -%>