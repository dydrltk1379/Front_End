class Solution {
    int[] board = new int[12];
    int answer = 0;
    public int solution(int n) {
        for(int i=0; i<n; i++){
            board[0]=i;
            queen(n, 1);
        }

        return answer;
    }
    void queen(int n, int idx){
        if(idx==n){
            answer++;
            return;
        }
        for(int i=0; i<n; i++){
            boolean check=true;
            for(int j=0; j<idx; j++){
                board[idx]=j;
                if(board[j]==board[idx] || Math.abs(j-idx)==Math.abs(board[j]-board[idx])){
                    check=false;
                }
            }
            if(check){
                queen(n, idx+1);
            }
        }
    }
}