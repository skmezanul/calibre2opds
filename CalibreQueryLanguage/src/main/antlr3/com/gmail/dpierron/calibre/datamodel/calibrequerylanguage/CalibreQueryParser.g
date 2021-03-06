parser grammar CalibreQueryParser;

options {

    // Default language but name it anyway
    //
    language  = Java;

    // Produce an AST
    //
    output    = AST;

    // Use a superclass to implement all helper
    // methods, instance variables and overrides
    // of ANTLR default methods, such as error
    // handling.
    //
    superClass = AbstractTParser;

    // Use the vocabulary generated by the accompanying
    // lexer. Maven knows how to work out the relationship
    // between the lexer and parser and will build the 
    // lexer before the parser. It will also rebuild the
    // parser if the lexer changes.
    //
    tokenVocab = CalibreQueryLexer;
}

tokens {
	LEFT_PAREN;
	RIGHT_PAREN;

	AND;
	OR;
	NOT;

	TAG;
	TAG_TRUE;
	TAG_FALSE;

	LANG;
	LANG_TRUE;
	LANG_FALSE;

	RATING;
	RATING_TRUE;
	RATING_FALSE;

	AUTHOR;
	AUTHOR_TRUE;
	AUTHOR_FALSE;

	SERIES;
	SERIES_TRUE;
	SERIES_FALSE;

	FORMAT;
	FORMAT_TRUE;
	FORMAT_FALSE;

	PUBLISHER;
	PUBLISHER_TRUE;
	PUBLISHER_FALSE;

	// CUSCOL;
	// CUSCOL_TRUE;
	// CUSCOL_FALSE;

}

// What package should the generated source exist in?
//
@header {

    package com.gmail.dpierron.calibre.datamodel.calibrequerylanguage;
}


/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/
expr : orexpression;

orexpression
    :   andexpression (OR^ andexpression)*
    ;
    
andexpression
    : notexpression (AND^ notexpression)*
    ;

notexpression
    : (NOT^)? atom
    ;

atom
    : condition
    | LEFT_PAREN! orexpression RIGHT_PAREN!
    ;
    
condition
    : TAG | TAG_TRUE | TAG_FALSE
    | LANG | LANG_TRUE | LANG_FALSE
    | RATING | RATING_TRUE | RATING_FALSE
    | AUTHOR | AUTHOR_TRUE | AUTHOR_FALSE
    | SERIES | SERIES_TRUE | SERIES_FALSE
    | FORMAT | FORMAT_TRUE | FORMAT_FALSE
    | PUBLISHER | PUBLISHER_TRUE | PUBLISHER_FALSE
    // | CUSCOL | CUSCOL_TRUE | CUSCOL_FALSE
    ;

