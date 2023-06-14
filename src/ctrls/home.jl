using Oxygen: html

function home_controller()
    @info "Home response"
    return html("""
    <html>
        <head>
            <title>Home</title>
        </head>
        <body style="text-align: center; padding-top: 200px;" >
            <img src="/static/logo.svg" style="width: 280px;" />
            <br />
            <h1>Home</h1>
            <br />
            <a href="/sample/hello">Sample</a>
        </body>
    </html>
    """)
end
