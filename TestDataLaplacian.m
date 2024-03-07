eeglabpath = '/Users/daphne/Desktop/StephenLab Rotation/DT/eeglab2024.0';  % New EEGLAB path
addpath(genpath(eeglabpath));  % Adds the new EEGLAB path and its subdirectories to MATLAB's search path
savepath;

Nchannels = length(HDR.label_finalized);  % Number of channels
data_test = eye(Nchannels);  % Identity matrix as test data

data_laplac_test = OthercalculateLaplacian(data_test, HDR.label_finalized, Electrode_neighbors);

chanlocs = struct('labels', HDR.label_finalized);

chanlocs = pop_chanedit(chanlocs, 'lookup', fullfile(eeglabpath, 'plugins', 'dipfit', 'standard_BESA', 'standard-10-5-cap385.elp'));

for i = 1:Nchannels
    figure;  % Create a new figure for each channel's plot
    topoplot(data_laplac_test(:, i), chanlocs);  % Use 'chanlocs' with spatial information
    title(sprintf('Laplacian of Channel %s', HDR.label_finalized{i}));
end
