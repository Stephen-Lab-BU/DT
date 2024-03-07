function data_laplac = calculateLaplacian(data, ch_labels, montage)
    % Ensure ch_labels and keys of montage map are consistent
    assert(all(ismember(ch_labels, keys(montage))), 'All channels must be in the montage.');

    % Initialize the output matrix with zeros
    [Nchannels, Ntimepoints] = size(data);
    data_laplac = zeros(Nchannels, Ntimepoints);

    for i = 1:Nchannels
        channel = ch_labels{i};
        
        % Retrieve neighbors as a cell array of strings from the montage
        neighbors = montage(channel); % Here, neighbors are directly taken as a cell array from the montage
        
        % Find indices of neighbors in ch_labels
        [~, neighbors_indices] = ismember(neighbors, ch_labels);
        
        % Check if there are enough neighbors
        if numel(neighbors_indices) < 2
            fprintf('Warning: Not enough neighbors for channel %s\n', channel);
            continue;  % Skip to the next channel
        end
        
        % Calculate the Laplacian-referenced data
        data_laplac(i, :) = data(i, :) - mean(data(neighbors_indices, :), 1);
    end
end
