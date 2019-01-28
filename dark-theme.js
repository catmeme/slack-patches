document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   // shasum: d3cb311a28c6160787b4eb4e5555433906d1bbfd
   url: 'https://gist.githubusercontent.com/catmeme/64aab8de30d2a65a4d34ea098fba9be9/raw/2d182d3e033544ed9f148426b48e9fbeae7bc6e8/slack-dark.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
