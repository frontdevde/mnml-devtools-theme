'use strict'

module.exports = (grunt) ->
  grunt.initConfig
    
    pkg: grunt.file.readJSON 'package.json'
    home: process.env.HOME or process.env.HOMEPATH or process.env.USERPROFILE

    less:
      default:
        files: 
          'Custom.css': 'Custom.less'
    
    copy:
      mac:
        files:
          '<%= home %>/Library/Application Support/Google/Chrome/Default/User StyleSheets/Custom.css': 'Custom.css'
      win: {}
      lin: {}

    watch:
      mac:
        files: 'Custom.less'
        tasks: [
          'less'
          'copy:mac'
        ]
      win:
        files: 'Custom.less'
      lin:
        files: 'Custom.less'
        
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['less','copy:mac']
