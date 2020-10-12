when CLIENT_ACCEPTED {
    set add_persist 1
}
when HTTP_RESPONSE {
    if { [HTTP::cookie exists "JSESSIONID"] and $add_persist } {
    persist add uie [HTTP::cookie "JSESSIONID"]
    set add_persist 0
   }
}
when HTTP_REQUEST {
    if { [HTTP::cookie exists "JSESSIONID"] } {
    persist uie [HTTP::cookie "JSESSIONID"]
 }  else {
    set jsess [findstr [HTTP::uri] "jsessionid" 11 ";"]
    if { $jsess != "" } {
    persist uie $jsess
   }
  }
}
