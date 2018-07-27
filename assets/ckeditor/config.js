/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.extraPlugins = 'uploadimage, mentions';
	config.mentions = [ {
          feed: '/ckeditor/user_autocomplete?value={encodedQuery}',
          marker: '@',
          itemTemplate: '<li data-id="{id}">' +
                '<img class="avatar" src="{avatar}" height="14" width="14" />' +
	        '<strong class="username">{username}</strong>' +
		'<span class="fullname">{fullname}</span>' +
		'</li>',
          outputTemplate: '<a href="/users/{id}">@{username}</a><span>&nbsp;</span>',
	  minChars: 1
        } ];
};
