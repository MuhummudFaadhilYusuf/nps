class JsonIp
    def self.ip
        uri = URI('https://ip.seeip.org/json')
        response = Net::HTTP.get(uri)
        JSON.parse(response)["ip"]
    end
end