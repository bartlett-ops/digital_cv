import * as dotenv from "dotenv";
import express, { Express, Request, Response } from 'express';

dotenv.config();

if (!process.env.PORT) {
  process.exit(1)
}
const PORT: number = parseInt(process.env.PORT as string, 10)
const app: Express = express();

/**
 *  App Configuration
 */
app.use(express.json());
app.get("/", (_req: Request, res: Response): void => {
  res.send('Hello World'); 
})

/**
 * Server Activation
 */
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
