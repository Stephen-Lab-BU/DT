function data_laplac = calculateLaplacian(data, ch_labels, montage)
    % Ensure the number of channels in 'data' matches the length of 'ch_labels'
    assert(size(data, 1) == length(ch_labels), 'Mismatch between data rows and channel labels');

    [Nchannels, ~] = size(data);
    data_laplac = zeros(Nchannels, size(data, 2));  % Initialize the output matrix

    for i = 1:Nchannels
        channel = ch_labels{i};  % Current channel label
        if ~isKey(montage, channel)
            warning('Channel %s not found in montage, skipping.', channel);
            continue;
        end

        neighbors = montage(channel);  % Get neighbors from the montage
        neighbor_indices = find(ismember(ch_labels, neighbors));  % Find indices of neighbors in 'ch_labels'

        % Ensure there are enough neighbors
        if numel(neighbor_indices) < 2
            warning('Not enough neighbors for channel %s', channel);
            continue;
        end

        % Calculate Laplacian-referenced signal for the current channel
        data_laplac(i, :) = data(i, :) - mean(data(neighbor_indices, :), 1);
    end
end
