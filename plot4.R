png(file='plot4.png', width=480, height=480)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=';')
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data_plot4 <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

par(mfrow=c(2,2))

data_plot4$Time <- format(as.POSIXct(paste(data_plot4$Date, data_plot4$Time)), "%Y-%m-%d %H:%M:%S")
data_plot4$Time <- strptime(data_plot4$Time, format="%Y-%m-%d %H:%M:%S")
data_plot4$Global_active_power <- as.numeric(as.character(data_plot4$Global_active_power))
plot(data_plot4$Time, data_plot4$Global_active_power, type='l', ylab='Global Active Power', xlab='')

data_plot4$Voltage <- as.numeric(as.character(data_plot4$Voltage))
plot(data_plot4$Time, data_plot4$Voltage, type='l', xlab='datetime', ylab='Voltage')

data_plot4$Sub_metering_1 <- as.numeric(as.character(data_plot4$Sub_metering_1))
data_plot4$Sub_metering_2 <- as.numeric(as.character(data_plot4$Sub_metering_2))
data_plot4$Sub_metering_3 <- as.numeric(as.character(data_plot4$Sub_metering_3))
with(data_plot4, plot(Time, Sub_metering_1, xlab='', ylab='Energy sub metering', type='l'))
with(data_plot4, lines(Time, Sub_metering_2, col='red'))
with(data_plot4, lines(Time, Sub_metering_3, col='blue'))
legend('topright', pch=c(NA, NA, NA), lwd=1, bty='n', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

data_plot4$Global_reactive_power <- as.numeric(as.character(data_plot4$Global_reactive_power))
plot(data_plot4$Time, data_plot4$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()
