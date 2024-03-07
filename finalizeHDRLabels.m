function HDR = finalizeHDRLabels(HDR, Electrode_neighbors)
    % Define channels to remove due to lack of montage information or other reasons
    channelsToRemove = {'PO5', 'po5', 'PO6', 'po6'};

    % Remove these channels from HDR.label_updated before finalizing
    HDR.label_finalized = setdiff(HDR.label_updated, channelsToRemove, 'stable');

    % Remove channels from Electrode_neighbors not present in HDR.label_finalized
    keysToRemove = setdiff(keys(Electrode_neighbors), HDR.label_finalized);
    for key = keysToRemove
        remove(Electrode_neighbors, key{1});
    end

    % For each channel in Electrode_neighbors, ensure its neighbors are in HDR.label_finalized
    for key = keys(Electrode_neighbors)
        neighbors = Electrode_neighbors(key{1});
        validNeighbors = intersect(neighbors, HDR.label_finalized);
        Electrode_neighbors(key{1}) = validNeighbors;
        
        % If a channel has no valid neighbors left, remove it from label_finalized
        if isempty(validNeighbors)
            HDR.label_finalized = HDR.label_finalized(~strcmp(HDR.label_finalized, key{1}));
        end
    end
    
    % Optionally, update the HDR structure to include the cleaned-up Electrode_neighbors
    HDR.Electrode_neighbors_finalized = Electrode_neighbors;
end
