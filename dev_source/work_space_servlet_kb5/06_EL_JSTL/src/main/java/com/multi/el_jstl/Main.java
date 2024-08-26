import java.util.*;

class Solution {
    public int solution(int n, int[][] wires) {
        int answer = -1;
        List<List<Integer>> list = new LinkedList<>();
        for(int i = 0; i < wires.length; i++) {
            list.add(new ArrayList<>());
        }
        for(int i = 0; i < wires.length; i++) {
            list.get(i).add(wires[i][0]);
            list.get(i).add(wires[i][1]);
        }
        for(int i=0; i<wires.length; i++){
            List<List<Integer>>tmplist = new ArrayList<>();
            for(List<Integer> sublist : list){
                tmplist.add(new ArrayList<>(sublist));
            }
            tmplist.remove(i);
            int[][] wire = new int[wires.length-1][2];
            System.out.println(tmplist.get(i).get(0)+" "+tmplist.get(i).get(1));
        }


        return answer;
    }
}