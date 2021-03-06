
CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...
  config.uiColor = '#c0dfd9';
  config.toolbar_Pure = [
    '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
    }, {
      name: 'links',
      items: ['Link', 'Unlink']
    }, '/', {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, {
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }//, {
    //   name: 'insert',
    //   items: ['Image', 'Table', 'HorizontalRule', 'PageBreak']
    // }
  ];
  config.toolbar = 'Pure';

  // ... rest of the original config.js  ...
}
