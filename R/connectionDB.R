data.catalogue <- function (Server,IP,Schema,ID,PW)
{
  connectionDetails <- DatabaseConnector::createConnectionDetails(dbms=Server,
                                                                  server=IP,
                                                                  schema=Schema,
                                                                  user=ID,
                                                                  password=PW)

  connection <- DatabaseConnector::connect(connectionDetails)

  result <-catalogue_function(connectionDetails = connectionDetails,
                              connection = connection)
  return(result)
}

##Sys.setlocale(category="LC_CTYPE", locale="UTF-8")
