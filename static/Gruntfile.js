module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    less_root:'src/less',
    css_root: 'dist/css',
    js_root:'src/js',
    src: 'src',
    dist: 'dist',
    less:{
      development: {
        options: {
          linenos: true
        },
        src: '<%= less_root %>/entry.less',
        dest: '<%= css_root %>/styles.css'
      },
      production: {
        options: {
          compress: true,
          linenos: false
        },
        src: '<%= less_root %>/entry.less',
        dest: '<%= css_root %>/styles.min.css'
     }
    },
    copy: {
      html: {
        expand: true,
        cwd: '<%= src %>',
        src: ['**/*.html'],
        dest: '<%= dist %>',
        ext: '.html'
      },
      js:{
        expand: true,
        cwd: '<%= src %>/js',
        src: ['**/*.js'],
        dest: '<%= dist %>/js',
        ext: '.js'
      },
    },
    watch: {
      options: {
        livereload: true
      },
      html: {
        files: ['<%=src%>/**/*.html'],
        tasks: ['copy:html']
      },
      css: {
        files: ['<%= less_root %>/**/*.less'],
        tasks: ['less:development']
      },
      js: {
        files: ['<%= js_root %>/**/*.js'],
        tasks: ['copy:js']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.registerTask('default', ['watch']);
};
