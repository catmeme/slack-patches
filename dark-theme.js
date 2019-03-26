document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   // shasum: f23a8ff0326c496da840563de4c13074e4e7399d
   url: 'https://raw.githubusercontent.com/catmeme/slack-patches/master/dark-theme.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
