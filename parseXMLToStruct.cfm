
<cfscript>
/**
* GitHub:       https://github.com/andreasRu/basicXMLtoStructParser
* Purpose:      Helper Component To Map/Translate/parse XML keynames and values
* Author:       Andreas Rüger 
* Web:          www.rhein-berg-digital.de
* Since:       2022-10-21
 */
    

// define vars
xmlFileArray=[:];
arrayCount=1;

// init Component
XMLService = new XMLService();

// get available xml file
cfdirectory( directory="xmlfiles" action="list" name="xmlfiles" type="file" filter="*.xml");

// parse XML files and store data in array
for( file in xmlfiles ){
    file = FileRead( file.directory & "/" &  file.name );
    variables.xmlFileArray[arrayCount]= xmlParse( file )["XmlRoot"];
    arrayCount++;    
}


cfloop( array="#xmlFileArray#" index="index" item="xmlItem") {
    variables.data[ index ]=XMLService.mapXMLData( xmlItem );
    dump( variables.data[ index ] );
}


</cfscript>

