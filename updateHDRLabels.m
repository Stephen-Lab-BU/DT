function HDR = updateHDRLabels(HDR)
    % Define channels to remove
    channelsToRemove = {'M1', 'M2', 'FT8', 'FT7'};

    % Remove unwanted channels from HDR.label and keep only the first 60
    HDR.label_updated = HDR.label(~ismember(HDR.label, channelsToRemove));
    
    % Check if there are at least 60 channels left
    if length(HDR.label_updated) >= 60
        HDR.label_updated = HDR.label_updated(1:60);  % Update HDR structure directly
    else
        error('Not enough channels after removing unwanted channels.');
    end
end
