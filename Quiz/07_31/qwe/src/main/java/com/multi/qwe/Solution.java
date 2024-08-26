class Solution {
    int answer = 0;
    int n=0;
    boolean[] visit = new boolean[17];
    public int solution(int[] info, int[][] edges) {
        n=info.length;
        dfs(info, edges, 0, 0, 0, 0);
        return answer;
    }
    void dfs(int[] info, int[][] edges, int s, int w, int idx, int cnt){
        if(info[idx]==0){
            s++;
        }else{
            w++;
        }
        if(s<=w){
            return;
        }
        answer=Math.max(answer,s);
        for(int i=0; i<n; i++){
            if(!visit[i]&&edges[i][0]==idx){
                visit[i]=true;
                dfs(info, edges, s, w , edges[i][1], cnt+1);
                visit[i]=false;
            }
        }
    }
}