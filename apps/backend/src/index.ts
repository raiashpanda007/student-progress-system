import express from 'express';
import { config as _config } from 'dotenv';
import cors from 'cors';
import Prisma from '@workspace/database';

_config();

class App {
    private app: express.Application;

    constructor() {
        this.app = express();
        this.initializeRoutes();
        this.initializeMiddlewares();
    }

    private initializeRoutes() {
        this.app.get('/health-check', (req, res) => {
            res.status(200).json({ message: 'Backend is healthy' });
        });
    }
    private initializeMiddlewares() {
        this.app.use(cors({
            origin: [
                'http://localhost:3000',
            ],
            credentials: true
        }));
        this.app.use(express.json())
    }


    public listen(port: number) {
        this.app.listen(port || 3001, () => {
            console.log(`Server is running on port ${port}`);
        });
    }
}

const app = new App();
app.listen(parseInt(process.env.PORT || '3001'))