classdef params
    
properties (Constant)
    
    
    num_users = 70;         % numer of users
    space_size = 700;       % size of simulation space
    user_distance = 60;     % max. distance between conflicting users
    edge_length = 120;      % edge lenth of a hexagon around a basestation
    num_subcarrier = 25;    % 25 Subcarrier
    RB_spacing = 180000;    % 180kHz
    timestep = 0.001;       % 1ms
    bhaul = 100000;         % 100 Mbit/s
    sim_limit= 5000;
    
    n_u_antennas = [1, 1, 4, 8];
    n_b_antennas = [1, 4, 1, 8];
    n_feed_subcarriers = [25, 32, 32, 32];
    chan_freq = [10000000,10000000,10000000,10000000];
    n_chan_subcarriers = [128, 128, 128, 128];
    chan_pdp = [[0 -1; 50 -1; 120 -1; 200 0; 230 0; 500 0; 1600 -3; 2300 -5; 5000 -7],...
    [0 -1; 50 -1; 120 -1; 200 0; 230 0; 500 0; 1600 -3; 2300 -5; 5000 -7],...
    [0 -1; 50 -1; 120 -1; 200 0; 230 0; 500 0; 1600 -3; 2300 -5; 5000 -7],...
    [0 -1; 50 -1; 120 -1; 200 0; 230 0; 500 0; 1600 -3; 2300 -5; 5000 -7]];
    chan_df = [180000,180000,180000,180000];
    n_basestations = [4,6,8,10];
    n_users = [25,30,35,40];
    num_simul = randi(4)
end

end

