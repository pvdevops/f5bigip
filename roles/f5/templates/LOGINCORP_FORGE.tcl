when HTTP_REQUEST {
  if { [HTTP::uri] contains "/am/SSORedirect" } {
    pool {{ poolname1 }} 
  }
  elseif { [HTTP::uri] contains "/am/saml2" } {
    pool {{ poolname1 }} 
    }
   else {
      pool {{ poolname2 }} 
   }
}
