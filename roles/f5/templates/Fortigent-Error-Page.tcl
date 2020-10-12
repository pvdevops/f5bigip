when CLIENT_ACCEPTED {
    set default_pool [LB::server pool]
}

when HTTP_REQUEST {
    if { [active_members $default_pool] < 1 } { 
        HTTP::respond 200 content [ifile get "/Common/Server_Error.html"] noserver "Content-Type" "text/html" "Cache-Control" "no-cache, must-revalidate" 
    }
} 

when LB_FAILED { 
    HTTP::respond 200 content [ifile get "/Common/Server_Error.html"] noserver "Content-Type" "text/html" "Cache-Control" "no-cache, must-revalidate" 
}
