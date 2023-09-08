import {
  Avatar,
  Box,
  Button,
  Checkbox,
  FormControlLabel,
  Grid,
  Link,
  Paper,
  Stack,
  TextField,
  Typography,
} from "@mui/material";
import { teal } from "@mui/material/colors";

// import firebaseConfig from "../../public/firebaseConfig";

export default function Login() {
  return (
    <Grid>
      <Paper
        elevation={3}
        sx={{
          p: 4,
          height: "70vh",
          width: "280px",
          m: "20px auto",
        }}
      >
        <Grid
          container
          direction="column"
          justifyContent="flex-start" //多分、デフォルトflex-startなので省略できる。
          alignItems="center"
        >
          <Typography variant={"h5"} sx={{ m: "30px" }}>
            ログイン
          </Typography>
        </Grid>
        <TextField
          label="メールアドレス"
          variant="standard"
          fullWidth
          required
        />
        <TextField
          type="password"
          label="パスワード"
          variant="standard"
          fullWidth
          required
        />
        <Box mt={3}>
          <Button type="submit" color="primary" variant="contained" fullWidth>
            サインイン
          </Button>
        </Box>
      </Paper>
    </Grid>
  );
}
