library(taskscheduleR)

myscript <- system.file("extdata", "fechamento_ibov.R", package = "taskscheduleR")

taskscheduler_create(taskname = "myfancyscript_sunsat", rscript = myscript, 
                     schedule = "WEEKLY", starttime = "09:00", days = c('SUN', 'SAT'))
