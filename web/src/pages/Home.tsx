import { Button } from "@/components/ui/button";
import { Link } from "react-router";

export default function Home() {
    return (
        <div className="p-8">
            <h1 className="text-white text-3xl">Home Page</h1>
            <Link to="/dashboard">
                <Button>Go to Dashboard</Button>
            </Link>
        </div>
    );
}
