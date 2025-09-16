import Home from "./pages/Home";
import { Route, Routes } from "react-router";

export default function App() {
    return (
        <Routes>
            <Route path="/" element={<Home />} />
        </Routes>
    );
}