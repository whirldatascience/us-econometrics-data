require(XML)
apiUrl<-"http://www.bea.gov/api/data/?&UserID=<YOUR API KEY>&method=GetData&datasetname=RegionalData&KeyCode=GDP_SP&GeoFIPS=STATE&ResultFormat=XML&Year=2010,2011,2012,2013,2014,2015"
doc = xmlParse(apiUrl)
Data = getNodeSet(doc, "//Results//Data")
country<-sapply(Data, function(el) xmlGetAttr(el, "GeoName"))

gdp<-sapply(Data, function(el) xmlGetAttr(el, "DataValue"))
year<-sapply(Data, function(el) xmlGetAttr(el, "TimePeriod"))

gdp_op<-data.frame(c(country))
gdp_op<-cbind(gdp_op,c(gdp),c(year))
write.csv(gdp_op,"gdp.csv",row.names=FALSE)
