package config.disaster.disaster {
    public interface IDisaster_level_event_normal
    {
        // ATTRIBUTES
        function get name():String;
        function get img():String;
        function get desc():String;
        // ELEMENTS
        function get quest():Vector.<IDisaster_level_event_normal_quest>;
        
    }
} 