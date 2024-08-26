class Solution {
    char[][] ans = new char[9][9]; // Initialize ans to be a 9x9 array

    public void solveSudoku(char[][] board) {
        // Perform a deep copy of the board to ans
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                ans[i][j] = board[i][j];
            }
        }
        dfs(board, 0);
        // Copy the solution back to the original board
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                board[i][j] = ans[i][j];
            }
        }
    }

    void dfs(char[][] b, int cnt) {
        if (cnt == 81) {
            // Deep copy the current board to ans when a solution is found
            for (int i = 0; i < 9; i++) {
                for (int j = 0; j < 9; j++) {
                    ans[i][j] = b[i][j];
                }
            }
            return;
        }
        int y = cnt / 9;
        int x = cnt % 9;
        if (b[y][x] != '.') {
            dfs(b, cnt + 1);
            return;
        }
        for (int k = 1; k <= 9; k++) {
            char c = (char) ('0' + k);
            if (check(b, y, x, c)) {
                b[y][x] = c;
                dfs(b, cnt + 1);
                b[y][x] = '.';
            }
        }
    }

    boolean check(char[][] b, int y, int x, char v) {
        for (int i = 0; i < 9; i++) {
            if (b[y][i] == v || b[i][x] == v) {
                return false;
            }
        }

        int col = (y / 3) * 3;
        int row = (x / 3) * 3;
        for (int i = col; i < col + 3; i++) {
            for (int j = row; j < row + 3; j++) {
                if (b[i][j] == v) {
                    return false;
                }
            }
        }
        return true;
    }
}
