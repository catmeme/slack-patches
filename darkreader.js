document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   // shasum: 5ec7e3e53cf30bfa288d5afa7e26cb308385acee
   url: 'https://raw.githubusercontent.com/catmeme/slack-patches/master/darkreader.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
