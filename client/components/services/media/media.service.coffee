'use strict'

angular.module 'twatterApp'
.factory 'Media', (Upload) ->
  #File uploads
  upload: (files) ->
    policy = 'ewogICJleHBpcmF0aW9uIjogIjIwMjAtMDEtMDFUMDA6MDA6MDBaIiwKICAiY29uZGl0aW9ucyI6IFsKICAgIHsiYnVja2V0IjogInR3YXR0ZXIifSwKICAgIFsic3RhcnRzLXdpdGgiLCAiJGtleSIsICIiXSwKICAgIHsiYWNsIjogInByaXZhdGUifSwKICAgIFsic3RhcnRzLXdpdGgiLCAiJENvbnRlbnQtVHlwZSIsICIiXSwKICAgIFsic3RhcnRzLXdpdGgiLCAiJGZpbGVuYW1lIiwgIiJdLAogICAgWyJjb250ZW50LWxlbmd0aC1yYW5nZSIsIDAsIDUyNDI4ODAwMF0KICBdCn0='
    signature = 'lMWJ1DSwqUL9CscGLldhD+/CCFY='

    if files?
      for file in files
        Upload.upload {
          url: 'https://twatter.s3.amazonaws.com/'
          method: 'POST'
          transformRequest: (data, headersGetter) ->
            headers = headersGetter()
            delete headers['Authorization']
            data
          fields :
            key: file.name,
            AWSAccessKeyId: 'AKIAIHYB27BHRD26LEHA'
            acl: 'private'
            policy: policy
            signature: signature
            "Content-Type": if file.type isnt '' then file.type else 'application/octet-stream'
            filename: file.name
          file: file
        }
        .success (data, status, headers, config) ->
          #return the config on success
          config.$promise

