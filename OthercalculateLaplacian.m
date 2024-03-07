function data_laplac = OthercalculateLaplacian(data, ch_labels, montage)
    % Validate input sizes
    assert(size(data, 1) == length(ch_labels), 'Mismatch between data rows and channel labels');
    
    % Initialize the output matrix
    data_laplac = zeros(size(data));  % Same dimensions as input data
    
    for i = 1:length(ch_labels)  % Iterate over channels
        channel = ch_labels{i};  % Current channel label
        
        % Ensure current channel exists in the montage map
        if ~isKey(montage, channel)
            warning('Channel %s not found in montage, skipping.', channel);
            continue;  % Skip to the next channel
        end

        % Retrieve neighbor labels from the montage
        neighbors = montage(channel);
        
        % Find indices of neighbors in ch_labels
        neighbor_indices = find(ismember(ch_labels, neighbors));
        
        % Check for sufficient neighbors
        if numel(neighbor_indices) < 2
            warning('Not enough neighbors for channel %s', channel);
            continue;  % Skip to the next channel if not enough neighbors
        end
        
        % Calculate Laplacian-referenced signal
        data_laplac(i, :) = data(i, :) - mean(data(neighbor_indices, :), 1);
    end
end
