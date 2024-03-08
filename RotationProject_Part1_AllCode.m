% Define all 66 electrodes
MainElectrode = {'FPz', 'AFz', 'Fz', 'FCz', 'Cz', 'CPz', 'Pz', 'POz', 'Oz', 'Iz', 'FP1', 'AF3', 'F1', 'FC1', 'CP1', 'P1', 'F3', 'FC3', 'C3', 'CP3', 'P3', 'PO3', 'O1', 'AF7', 'F7', 'FT7', 'T7', 'TP9', 'P9', 'F5', 'FC5', 'C5', 'CP5', 'P5', 'PO7', 'TP7', 'P7', 'FP2', 'AF4', 'F4', 'FC4', 'C4', 'CP4', 'P4', 'PO4', 'O2', 'F2', 'FC2', 'C2', 'CP2', 'P2', 'AF8', 'F6', 'FC6', 'C6', 'CP6', 'P6', 'PO8', 'F8', 'T8', 'TP8','P10', 'FT8','C1','P8','TP10'};

% Create a containers.Map object to store electrode neighbors
Electrode_neighbors = containers.Map();

%%
% Define electrode neighbors using the map
Electrode_neighbors('FPz') = {'FP1', 'FP2', 'AFz', 'AF3','AF4'};
Electrode_neighbors('AFz') = {'FPz', 'AF4', 'AF3', 'F2'};
Electrode_neighbors('AF3') = {'AFz', 'F1', 'F3', 'AF7'};
Electrode_neighbors('AF4') = {'AF8', 'AFz', 'F4', 'FP2'};
Electrode_neighbors('AF7') = {'FP1', 'AF3', 'F5', 'F7'};
Electrode_neighbors('AF8') = {'FP2', 'AF4', 'F8', 'F6'};
Electrode_neighbors('C1') = {'FC1', 'CP1', 'C3', 'Cz'};
Electrode_neighbors('AFz') = {'FPz', 'AF4', 'AF3', 'F2'};
Electrode_neighbors('C2') = {'C4', 'Cz', 'CP2', 'FC2'};
Electrode_neighbors('C3') = {'FC3', 'C1', 'C5', 'CP3'};
Electrode_neighbors('C4') = {'C6', 'C2', 'FC4', 'CP4'};
Electrode_neighbors('C5') = {'C3', 'T7', 'FC5', 'CP5'};
Electrode_neighbors('C6') = {'T8', 'C4', 'CP6', 'FC6'};
Electrode_neighbors('CP1') = {'CP2', 'CP3', 'C1', 'P1'};
Electrode_neighbors('CP2') = {'CP4', 'CPz', 'C2', 'P2'};
Electrode_neighbors('CP3') = {'CP1', 'CP5', 'C3', 'P3'};
Electrode_neighbors('CP4') = {'CP6', 'CP2', 'C4', 'P4'};
Electrode_neighbors('CP5') = {'CP3', 'C5', 'TP7', 'P5'};
Electrode_neighbors('CP6') = {'TP8', 'CP4', 'P6', 'C6'};
Electrode_neighbors('CPz') = {'Cz', 'CP2', 'CP1', 'Pz'};
Electrode_neighbors('Cz') = {'FCz', 'C1', 'C2', 'CPz'};
Electrode_neighbors('F1') = {'Fz', 'F3', 'FC1', 'AF3'};
Electrode_neighbors('F2') = {'AF4', 'F4', 'FC2', 'Fz'};
Electrode_neighbors('F3') = {'F1', 'F5', 'AF3', 'FC3'};
Electrode_neighbors('F4') = {'F6', 'F2', 'AF4', 'FC4'};
Electrode_neighbors('F5') = {'F3', 'F7', 'AF7', 'FC5'};
Electrode_neighbors('F6') = {'F8', 'FC6', 'F4', 'AF8'};
Electrode_neighbors('F7') = {'AF7', 'F5', 'FC5', 'FT7'};
Electrode_neighbors('F8') = {'FT8', 'F6', 'AF8', 'FC6'};
Electrode_neighbors('FC1') = {'FCz', 'FC3', 'F1', 'C1'};
Electrode_neighbors('FC2') = {'FC4', 'FCz', 'C2', 'F2'};
Electrode_neighbors('FC3') = {'FC1', 'FC5', 'C3', 'F3'};
Electrode_neighbors('FC4') = {'FC6', 'FC2', 'F4', 'C4'};
Electrode_neighbors('FC5') = {'F5', 'FC3', 'FT7', 'C5'};
Electrode_neighbors('FC6') = {'FT8', 'F6', 'C6', 'FC4'};
Electrode_neighbors('FCz') = {'Fz', 'FC2', 'FC1', 'Cz'};
Electrode_neighbors('FP1') = {'FPz', 'AF7', 'AF3', 'AFz'};
Electrode_neighbors('FP2') = {'AF4', 'AF8', 'FPz', 'AFz'};
Electrode_neighbors('FPz') = {'FP1', 'FP2', 'AFz', 'AF3', 'AF4'};
Electrode_neighbors('FT7') = {'FC5', 'F5', 'F7', 'T7'};
Electrode_neighbors('FT8') = {'T8', 'F8', 'FC6', 'F6'};
Electrode_neighbors('Fz') = {'AFz', 'F1', 'F2', 'FCz'};
Electrode_neighbors('Iz') = {'O2', 'Oz', 'O1'};
Electrode_neighbors('O1') = {'PO3', 'PO7', 'Iz', 'Oz', 'POz'};
Electrode_neighbors('O2') = {'PO8', 'Oz', 'POz', 'Iz','PO4'};
Electrode_neighbors('Oz') = {'O2', 'POz', 'O1', 'Iz'};
Electrode_neighbors('P1') = {'Pz', 'P3', 'CP1', 'PO3'};
Electrode_neighbors('P10') = {'P8', 'TP8', 'PO8', 'TP10'};
Electrode_neighbors('P2') = {'P4', 'Pz', 'CP2', 'PO4'};
Electrode_neighbors('P3') = {'P1', 'P5', 'CP3', 'PO3'};
Electrode_neighbors('P4') = {'P2', 'P6', 'CP4', 'PO4'};
Electrode_neighbors('P5') = {'P3', 'P7', 'CP5', 'PO7'};
Electrode_neighbors('P6') = {'P8', 'P4', 'CP6', 'PO8'};
Electrode_neighbors('P7') = {'P5', 'PO7', 'P9', 'TP9'};
Electrode_neighbors('P9') = {'P7', 'TP9', 'TP7', 'PO7'};
Electrode_neighbors('PO3') = {'P1', 'P3', 'O1', 'PO7'};
Electrode_neighbors('PO4') = {'PO8', 'O2', 'POz', 'P4'};
Electrode_neighbors('PO7') = {'P5', 'P7', 'O1', 'PO3'};
Electrode_neighbors('PO8') = {'P8', 'P6', 'PO4', 'O2'};
Electrode_neighbors('POz') = {'Pz', 'PO4', 'Oz', 'PO3'};
Electrode_neighbors('Pz') = {'P2', 'CPz', 'P1', 'POz'};
Electrode_neighbors('T7') = {'FT7', 'C5', 'TP7', 'TP9'};
Electrode_neighbors('T8') = {'TP10', 'FT8', 'C6', 'TP8'};
Electrode_neighbors('TP7') = {'CP5', 'TP9', 'P7', 'T7'};
Electrode_neighbors('TP8') = {'TP10', 'T8', 'P8', 'CP6'};
Electrode_neighbors('TP9') = {'T7', 'TP7', 'P9', 'P7'};
Electrode_neighbors('TP10') = {'TP8', 'T8', 'P10', 'PO8'};
Electrode_neighbors('P8') = {'TP8', 'P10', 'P6', 'PO8'};

%%
% Create a 66x66 matrix with zeros
AdjacencyMatrix = zeros(66, 66);

% Create a mapping from electrode names to indices
nameToIndex = containers.Map(MainElectrode, 1:length(MainElectrode));

% Add the matrix with 1s for pertinent neighbors
for i = 1:length(MainElectrode)
    Electrode = MainElectrode{i};
    if isKey(Electrode_neighbors, Electrode)
        neighbors = Electrode_neighbors(Electrode);
        for j = 1:length(neighbors)
            neighbor = neighbors{j};

            % Check if the neighbor is in the list to avoid errors
            if isKey(nameToIndex, neighbor)
                AdjacencyMatrix(i, nameToIndex(neighbor)) = 1;
            end
        end
    end
end

%% Changing HDR.label before Laplacian Calculations

% Load your .mat file containing the HDR structure
load('/Users/daphne/Desktop/StephenLab     Rotation/Archive_1_CN7.mat')

% Update the HDR structure with the new labels
HDR = updateHDRLabels(HDR);  % The entire HDR structure is updated

%% Verification Purposes before topoplot

% Create a table from the adajacency matrix with electrode labels
LaplacianElectrode_Table = array2table(AdjacencyMatrix, 'RowNames', MainElectrode, 'VariableNames', MainElectrode);

% Display part of the table to verify
disp(LaplacianElectrode_Table(1:10, 1:10));  % Adjust indices as necessary to verify everything
%%
%More Verification - Visualization
% Make sure the adjacency matrix is symmetric
AdjacencyMatrix = triu(AdjacencyMatrix) + triu(AdjacencyMatrix,1)';

% Create the graph object using the adjacency matrix
G = graph(AdjacencyMatrix);

% Create a cell array of labels for the electrodes
labels = MainElectrode;

% Plot the graph with the specified layout and labels
h = plot(G, 'Layout', 'force', 'NodeLabel', labels);

% To change the marker size, you can use:
h.MarkerSize = 7;

hold on;
%%
%Before running Laplacian Calculation Function
HDR = finalizeHDRLabels(HDR, Electrode_neighbors);
% Trim data to the first 58 rows, corresponding to the channels in HDR.label_finalized
data_trimmed = data(1:58, :);  % Adjust '58' if the number of channels changes


%%
%Laplacian Calculation 
% Assuming 'data' is your EEG data matrix, where each row corresponds to a channel in HDR.label_finalized
% and each column represents a time point

data_laplac = OthercalculateLaplacian(data_trimmed, HDR.label_finalized, Electrode_neighbors);

