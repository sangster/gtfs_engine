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

function createTableOfContents( elem ) {
  var i, s, level, item, link, id,
      tableLevel = 1,
      headers = findHeaders( elem ),
      table = document.createElement( 'ul' ),
      stack = [ table ],
      stackPointer = 1;

  headers.shift();

  for ( i = 0, s = headers.length; i < s; ++i ) {
    level = headerLevel( headers[ i ] );
    if ( level < tableLevel ) {
      tableLevel = level;
    }
  }

  for ( i = 0, s = headers.length; i < s; ++i ) {
    item = document.createElement( 'li' );
    id = headers[ i ].id;

    if ( id.length === 0 ) {
      id = headers[ i ].id = "header" + i;
    }

    link = document.createElement( 'a' );
    link.setAttribute( 'href', '#' + id );
    link.textContent = headers[ i ].textContent;

    item.appendChild( link );
    table.appendChild( item );
  }

  table.className = 'toc';

  return table;
}

function prependTableOfContent( elem ) {
  elem.insertBefore( createTableOfContents( elem ), elem.firstChild );
}


