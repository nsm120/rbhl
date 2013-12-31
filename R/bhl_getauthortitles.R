#' Return a list of titles associated with a given BHL author identifier. 
#' 
#' Unless the identifier  for a particular BHL author record is known in 
#'    advance, this method should be used in combination	with the AuthorSearch 
#'    method.
#'
#' @import httr
#' @importFrom plyr compact 
#' @param creatorid BHL identifier for a particular author (numeric)
#' @inheritParams bhl_authorsearch
#' @export
#' @examples \dontrun{
#' bhl_getauthortitles(1970)
#' bhl_getauthortitles(1970, output='raw')
#' bhl_getauthortitles(1970, output='raw', format='xml')
#' }
bhl_getauthortitles <- function(creatorid = NA, format = "json", output='list',
  key = getOption("BioHerLibKey", stop("need an API key for the BHL")), 
  callopts=list()) 
{
  if(output=='list') format='json'
  url = "http://www.biodiversitylibrary.org/api2/httpquery.ashx"
  args <- compact(list(op = "GetAuthorTitles", apikey = key, format = format, 
                       creatorid=creatorid))
  out <- GET(url, query = args, callopts)
  stop_for_status(out)
  tt <- content(out, as="text")
  if(output=='raw'){
    return( tt )
  } else if(output=='list')
  {
    return( fromJSON(I(tt)) )
  } else
  {
    if(format=="json"){ return(fromJSON(I(tt))) } else{ return(xmlTreeParse(I(tt))) }
  }
}