class JsonIp
    def ip
        # uri = URI('https://ip.seeip.org/json')
        # response = Net::HTTP.get(uri)
        # JSON.parse(response)["ip"]
        # HTTP.get('https://ip.seeip.org/json').parse(:json)["ip"]
        response["ip"]
    end

    def response
        HTTP.get('https://ip.seeip.org/json').parse(:json)["ip"]
    end
end 