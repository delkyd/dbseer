Dt12345_b0_orig_0_2128_conf = struct('dir', './tpcc4-redo', 'signature', 't12345-b0-orig', 'tranTypes', [1  2  3  4  5], 'startIdx', 3600, 'endIdx', 7000, 'io_conf', [1004040     1100       10], 'lock_conf', [0.080645      0.0001           2         0.8], 'actualMaxThroughput', 1549, 'groupingStrategy', struct());
task = TaskDescription;
task.workloadName = 'TPCC';
task.taskName = 'FlushRatePredictionByTPS';
task.whichTransactionToPlot = 1;
groupParams = struct('groupByTPSinsteadOfIndivCounts', false, 'byWhichTranTypes', [1 2 3 4 5],  'nClusters', 9, 'minFreq', 70, 'minTPS', 30, 'maxTPS', 950);
gp = GroupParameters;
gp.setStruct(groupParams);
test_config = PredictionConfigDesc;
test_config.dir = './t-memless-dist';
test_config.tranTypes = [1:5];
test_config.signature = 't12345-brk-100';
test_config.startIdx = 4000;
test_config.endIdx = 28000;
test_config.io_conf = [1525423.883 1000 8.606397511];
test_config.lock_conf = [0.080645      0.0001           2         0.8];
test_config.groupingStrategy = gp;
train_config_desc = PredictionConfigDesc;
train_config_desc.setStruct(Dt12345_b0_orig_0_2128_conf);
config = PredictionConfig;
config.addConfigDesc(test_config);
trainConfig = PredictionConfig;
trainConfig.addConfigDesc(train_config_desc);
config.initialize;
trainConfig.initialize;
pc = PredictionCenter;
pc.testConfig = config;
pc.trainConfig = trainConfig;
pc.taskDescription = task;
[title legends Xdata Ydata Xlabel Ylabel] = pc.performPrediction