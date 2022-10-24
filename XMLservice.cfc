 /**
* File:         XMLService.cfc
* GitHub:       https://github.com/andreasRu/basicXMLtoStructParser
* Purpose:      Helper Component To Map/Translate/parse XML keynames and values
* Author:       Andreas Rüger 
* Web:          www.rhein-berg-digital.de
* Since:       2022-10-21
 */
component displayname="Application" output="false" hint="maps properties to a struct" {
        
    
    /**
     * Constructor
     */
    private struct function init(){
                
            return this;

    }


    /**
     * Components Entry Point
     */
    public struct function mapXMLData( datastruct ) localmode="true" {
    
        datastruct=arguments.datastruct;
        result=[:];
        result[ datastruct.xmlName ]={};
          
        if( datastruct.xmlChildren.len() gt 0 ){
     
            datastruct.xmlChildren.each( function( element, index ) {
                
                result[ datastruct.xmlName ][ index ]=( mapXMLData( element ) );

            });
        
        }else{

            result[ datastruct.xmlName ]= datastruct.xmlText ;
            
        }


        if( !isEmpty( datastruct.XmlAttributes ) ){
            result[ datastruct.xmlName & "__ATTRIBUTES" ]={};
            datastruct.XmlAttributes.each( function( key, value) { 
                result[ datastruct.xmlName & "__ATTRIBUTES" ].append( { "#key#" =  "#value#" } ) ;
            });
        }

        return result;
    }

}
