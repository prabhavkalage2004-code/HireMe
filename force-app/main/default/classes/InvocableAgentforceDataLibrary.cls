/**
 * Invocable Apex Class for Agentforce Data Library Search
 * Author: Prabhav R. Kalage
 * Purpose: Allow Flows or Agentforce to search Knowledge Articles (or custom object)
 *          and return results in a structured format.
 */

public with sharing class InvocableAgentforceDataLibrary {

    /**
     * Invocable method that accepts search parameters from Flow/Agentforce
     */
    @InvocableMethod(label='Search Data Library' description='Search Knowledge Articles or custom data library for relevant content.')
    public static List<SearchResultWrapper> searchArticles(List<SearchRequestWrapper> requests) {
        
        List<SearchResultWrapper> allResults = new List<SearchResultWrapper>();

        for (SearchRequestWrapper req : requests) {

            // Validate input
            if (String.isBlank(req.searchTerm)) {
                SearchResultWrapper errorResult = new SearchResultWrapper();
                errorResult.results = new List<SearchResult>{
                    new SearchResult('Error', 'Search term cannot be blank', '')
                };
                allResults.add(errorResult);
                continue;
            }
            Integer limitSize = (req.recordLimit != null && req.recordLimit > 0) ? req.recordLimit : 5;

            // Query Knowledge Articles (replace Knowledge__kav with your Data Library object if needed)
            List<Knowledge__kav> records = [
                SELECT Id, Title, Summary
                FROM Knowledge__kav
                WHERE PublishStatus = 'Online'
                AND Language = 'en_US'
                AND (
                    Title LIKE :('%' + req.searchTerm + '%')
                    OR Summary LIKE :('%' + req.searchTerm + '%')
                )
                ORDER BY LastPublishedDate DESC
                LIMIT :limitSize
            ];

            // Prepare output wrapper
            SearchResultWrapper wrapper = new SearchResultWrapper();
            wrapper.results = new List<SearchResult>();

            for (Knowledge__kav rec : records) {
                wrapper.results.add(new SearchResult(
                    String.valueOf(rec.Id),
                    rec.Title,
                    rec.Summary
                ));
            }

            allResults.add(wrapper);
        }

        return allResults;
    }

    /**
     * Wrapper for input parameters from Flow/Agentforce
     */
    public class SearchRequestWrapper {
        @InvocableVariable(label='Search Term' required=true description='Keyword(s) to search for')
        public String searchTerm;

        @InvocableVariable(label='Record Limit' description='Max number of records to return')
        public Integer recordLimit;
    }

    /**
     * Wrapper for output results
     */
    public class SearchResultWrapper {
        @InvocableVariable(label='Results' description='List of matching articles')
        public List<SearchResult> results;
    }

    /**
     * DTO for each search result
     */
    public class SearchResult {
        @InvocableVariable(label='Record Id') public String recordId;
        @InvocableVariable(label='Title') public String title;
        @InvocableVariable(label='Summary') public String summary;

        public SearchResult(String recordId, String title, String summary) {
            this.recordId = recordId;
            this.title = title;
            this.summary = summary;
        }
    }
}