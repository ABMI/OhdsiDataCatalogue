#' OhdsiDataCatalogue Function
#'
#' This function allows you to see basic elements of the data catalogue automatically.
#' @param Server,IP,Schema,ID,PW : connection details.
#' @keywords data catalogue
#' @export
#' @examples
#' OhdsiDataCatalogue("sql server","IP","cdmdatabaseSchema","ID","PW")
OhdsiDataCatalogue <- function (Server,IP,Schema,ID,PW)
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

#Sys.setlocale(category="LC_CTYPE", locale="C")
