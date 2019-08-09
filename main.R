library(here)

datalog_filepath_1 = here('data', 'CFKADS2035-20181017-232848Z-DataLog_User.dat')
datalog_filepath_2 = here('data', 'CFKADS2035-20181018-002855Z-DataLog_User.dat')

data1 = read.table(datalog_filepath_1, header=TRUE)
data2 = read.table(datalog_filepath_1, header=TRUE)

# Merge the two datasets
data = merge(data1, data2)

# Only grab data range that is of interest to us.
# i.e. Between the beginning and the end of the AirCore sampling.
start_index = 3000
end_index = 6322
data = data[c(start_index: end_index),]

time_seq = data['EPOCH_TIME'][,1]
CO_seq = rev(data['CO'][,1])
CO2_seq = rev(data['CO2_dry'][,1])
CH4_seq = rev(data['CH4_dry'][,1])
pressure_seq = data['CavityPressure'][,1]

dev.new()
plot(y=time_seq, x=CO_seq,
     xlab='CO Concentration [ppb]',
     ylab='Air Pressure [hPa]',
     type='l', col='blue',)

dev.new()
plot(y=time_seq, x=CO2_seq,
     xlab='CO2 Concentration [ppm]',
     ylab='Air Pressure [hPa]',
     type='l', col='blue',)

dev.new()
plot(y=time_seq, x=CH4_seq,
     xlab='CH4 Concentration [ppm]',
     ylab='Air Pressure [hPa]',
     type='l', col='blue',)