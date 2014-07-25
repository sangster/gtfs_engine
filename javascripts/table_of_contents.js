( function( root ) {
    root.createToc = function( parent, removeTopLevel ) {
        var headers = cleanHeaders( findHeaders( parent ), removeTopLevel ),
        list = createList( headersHierarchy( headers ) );

        list.className = 'toc';
        parent.insertBefore( list, parent.firstChild );
    }


    function findHeaders( elem, list ) {
        var i, s, isHeader = ( headerLevel( elem ) !== -1 );

        if ( typeof list === 'undefined' ) {
            list = [];
        }

        if ( isHeader ) {
            list.push( elem );
        } else {
            for ( i=0, s=elem.childElementCount; i<s; ++i ) {
                findHeaders( elem.children[ i ], list );
            }
        }

        return list;
    }


    function headerLevel( elem ) {
        var name;
        if ( elem.nodeType === Node.ELEMENT_NODE ) {
            name = elem.tagName;
            if ( name.length === 2 && name[ 0 ] === 'H' ) {
                return parseInt( name[ 1 ] );
            }
        }
        return -1;
    }

    function cleanHeaders( headers, removeTopLevel ) {
        var i, minLevel, cleanHeaders = [];

        minLevel = headers.length ? headerLevel( headers[ 0 ] ) : 0;
        if( removeTopLevel ) {
            minLevel += 1;
        }

        for ( i = 0; i < headers.length; ++i ) {
            if ( headerLevel( headers[ i ] ) >= minLevel ) {
                cleanHeaders.push( headers[ i ] );
            }
        }

        return cleanHeaders;
    }


    function headersHierarchy( headersList, levelList ) {
        var prev, peek, levelDiff;

        if ( typeof levelList === 'undefined' ) {
            levelList = [];
        }

        if ( headersList.length === 0 ) {
            return levelList;
        }

        levelList.push( {
            header: headersList.shift(),
            children: [] 
        } );

        while ( headersList.length !== 0 ) {
            prev = levelList[ levelList.length - 1 ];
            peek = headersList[ 0 ];
            levelDiff = headerLevel( peek ) - headerLevel( prev.header );

            if ( levelDiff === 0 ) {
                levelList.push( {
                    header: headersList.shift(),
                    children: []
                } );
            } else if ( levelDiff > 0 ) {
                headersHierarchy( headersList, prev.children ); 
            } else {
                break;
            }
        }

        return levelList;
    }


    function createList( items ) {
        var i, size, head, item, children,
        list = document.createElement( 'ul' );

        for ( i = 0, size = items.length; i < size; ++i ) {
            head = items[ i ].header;
            children = items[ i ].children;

            item = document.createElement( 'li' );
            item.appendChild( headerLink( head, i ) );
            list.appendChild( item );

            if ( children.length !== 0 ) {
                item.appendChild( createList( children ) );
            }
        }

        return list;
    }


    function headerLink( header, index ) {
        var id, link;

        if ( header.id.length === 0 ) {
            header.id = "header" + index;
        }

        link = document.createElement( 'a' );
        link.setAttribute( 'href', '#' + header.id );
        link.textContent = header.textContent;

        return link;
    }
} )( window );


