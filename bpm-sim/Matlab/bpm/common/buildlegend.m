function legend_labels = buildlegend(text, variables)

if size(variables,1) == 1 || size(variables,2) == 1
    variables = variables(:);
end

legend_labels = cell(size(variables,1),1);
for i=1:size(variables,1)
    legend_labels{i} = sprintf(text, variables(i,:));
end