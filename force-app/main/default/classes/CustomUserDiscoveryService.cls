@RestResource(urlMapping='/headlessUserDiscovery/*')
global with sharing class CustomUserDiscoveryService {
    
    global class DiscoveryResponse {
        public String username;
        public String status;
    }
    
    @HttpPost
    global static DiscoveryResponse discoverUser() {
        RestRequest req = RestContext.request;
        Map<String, Object> requestBody = 
            (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
        String loginInput = (String) requestBody.get('loginInput');
        DiscoveryResponse response = new DiscoveryResponse();
        
        try {
            User u = [
                SELECT Id, Username 
                FROM User 
                WHERE Email = :loginInput 
                LIMIT 1
            ];
            response.username = u.Username;
            response.status = 'FOUND';
        } catch (Exception e) {
            response.username = null;
            response.status = 'NOT_FOUND';
        }
        
        return response;
    }
}